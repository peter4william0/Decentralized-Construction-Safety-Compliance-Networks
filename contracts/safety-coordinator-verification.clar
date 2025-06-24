;; Safety Coordinator Verification Contract
;; Manages registration and verification of construction safety coordinators

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_REGISTERED (err u101))
(define-constant ERR_NOT_FOUND (err u102))
(define-constant ERR_INVALID_STATUS (err u103))

;; Data structures
(define-map coordinators
  { coordinator: principal }
  {
    name: (string-ascii 100),
    license-number: (string-ascii 50),
    certification-level: uint,
    registration-date: uint,
    expiry-date: uint,
    status: (string-ascii 20),
    verified-by: principal
  }
)

(define-map coordinator-stats
  { coordinator: principal }
  {
    incidents-handled: uint,
    trainings-conducted: uint,
    compliance-score: uint
  }
)

(define-data-var total-coordinators uint u0)

;; Register a new safety coordinator
(define-public (register-coordinator
  (coordinator principal)
  (name (string-ascii 100))
  (license-number (string-ascii 50))
  (certification-level uint)
  (expiry-date uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-none (map-get? coordinators { coordinator: coordinator })) ERR_ALREADY_REGISTERED)

    (map-set coordinators
      { coordinator: coordinator }
      {
        name: name,
        license-number: license-number,
        certification-level: certification-level,
        registration-date: block-height,
        expiry-date: expiry-date,
        status: "active",
        verified-by: tx-sender
      }
    )

    (map-set coordinator-stats
      { coordinator: coordinator }
      {
        incidents-handled: u0,
        trainings-conducted: u0,
        compliance-score: u100
      }
    )

    (var-set total-coordinators (+ (var-get total-coordinators) u1))
    (ok true)
  )
)

;; Verify coordinator status
(define-read-only (is-coordinator-active (coordinator principal))
  (match (map-get? coordinators { coordinator: coordinator })
    coordinator-data (is-eq (get status coordinator-data) "active")
    false
  )
)

;; Get coordinator details
(define-read-only (get-coordinator-info (coordinator principal))
  (map-get? coordinators { coordinator: coordinator })
)

;; Update coordinator status
(define-public (update-coordinator-status (coordinator principal) (new-status (string-ascii 20)))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-some (map-get? coordinators { coordinator: coordinator })) ERR_NOT_FOUND)

    (map-set coordinators
      { coordinator: coordinator }
      (merge
        (unwrap-panic (map-get? coordinators { coordinator: coordinator }))
        { status: new-status }
      )
    )
    (ok true)
  )
)

;; Get total coordinators
(define-read-only (get-total-coordinators)
  (var-get total-coordinators)
)
