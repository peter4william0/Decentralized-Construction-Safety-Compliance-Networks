# Decentralized Construction Safety Compliance Networks

A comprehensive blockchain-based system for managing construction safety compliance using Clarity smart contracts on the Stacks blockchain.

## Overview

This project implements a decentralized network for construction safety compliance management, featuring five interconnected smart contracts that handle different aspects of construction safety:

- **Safety Coordinator Verification**: Manages registration and verification of safety coordinators
- **Incident Tracking**: Records and tracks safety incidents across construction sites
- **Training Management**: Handles safety training programs and worker certifications
- **Compliance Monitoring**: Monitors overall safety compliance across construction sites
- **Risk Assessment**: Manages construction risk assessments and mitigation plans

## Features

### 🔐 Safety Coordinator Verification
- Register and verify safety coordinators
- Track coordinator credentials and certifications
- Manage coordinator status and compliance scores
- Prevent unauthorized access to safety systems

### 📊 Incident Tracking
- Report safety incidents with detailed information
- Track incident severity levels (1-5 scale)
- Update incident status and resolutions
- Generate incident statistics and reports

### 🎓 Training Management
- Create and manage safety training programs
- Enroll workers in training courses
- Track training completion and scores
- Issue digital certificates for qualified workers

### 📈 Compliance Monitoring
- Register and monitor construction sites
- Conduct compliance checks and inspections
- Track compliance scores and violations
- Identify non-compliant sites requiring attention

### ⚠️ Risk Assessment
- Create comprehensive risk assessments
- Categorize and rate risk levels
- Develop mitigation plans
- Track critical risks across sites

## Smart Contract Architecture

### Contract Interactions
\`\`\`
Safety Coordinator ←→ Incident Tracking
↓                    ↓
Training Management ←→ Compliance Monitoring
↓                    ↓
└─→ Risk Assessment ←┘
\`\`\`

### Data Flow
1. **Coordinators** are verified through the Safety Coordinator contract
2. **Incidents** are reported and tracked with coordinator oversight
3. **Training** programs ensure worker competency
4. **Compliance** monitoring tracks overall site safety
5. **Risk assessments** identify and mitigate potential hazards

## Installation

### Prerequisites
- Node.js (v16 or higher)
- Clarinet CLI
- Stacks Wallet

### Setup
1. Clone the repository:
   \`\`\`bash
   git clone https://github.com/your-org/construction-safety-compliance.git
   cd construction-safety-compliance
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Initialize Clarinet project:
   \`\`\`bash
   clarinet integrate
   \`\`\`

## Usage

### Deploying Contracts

1. Deploy all contracts to testnet:
   \`\`\`bash
   clarinet deploy --testnet
   \`\`\`

2. Verify deployment:
   \`\`\`bash
   clarinet console
   \`\`\`

### Contract Interactions

#### Register a Safety Coordinator
\`\`\`clarity
(contract-call? .safety-coordinator-verification register-coordinator
'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG
"John Safety"
"CSC-12345"
u3
u1000000)
\`\`\`

#### Report an Incident
\`\`\`clarity
(contract-call? .incident-tracking report-incident
'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG
"Construction Site A"
"Fall"
u3
"Worker fell from scaffolding")
\`\`\`

#### Create Training Program
\`\`\`clarity
(contract-call? .training-management create-training-program
"Fall Protection Training"
"Comprehensive fall protection safety training"
u8
u2)
\`\`\`

## Testing

Run the test suite using Vitest:

\`\`\`bash
npm test
\`\`\`

Run specific test files:
\`\`\`bash
npm test safety-coordinator-verification.test.js
npm test incident-tracking.test.js
npm test training-management.test.js
npm test compliance-monitoring.test.js
npm test risk-assessment.test.js
\`\`\`

## API Reference

### Safety Coordinator Verification

#### Public Functions
- \`register-coordinator\`: Register a new safety coordinator
- \`update-coordinator-status\`: Update coordinator status

#### Read-Only Functions
- \`is-coordinator-active\`: Check if coordinator is active
- \`get-coordinator-info\`: Get coordinator details
- \`get-total-coordinators\`: Get total number of coordinators

### Incident Tracking

#### Public Functions
- \`report-incident\`: Report a new safety incident
- \`update-incident-status\`: Update incident status and resolution

#### Read-Only Functions
- \`get-incident\`: Get incident details
- \`get-total-incidents\`: Get total number of incidents
- \`get-incidents-by-severity\`: Filter incidents by severity

### Training Management

#### Public Functions
- \`create-training-program\`: Create a new training program
- \`enroll-worker\`: Enroll worker in training
- \`complete-training\`: Mark training as completed

#### Read-Only Functions
- \`get-training-program\`: Get training program details
- \`get-worker-training\`: Get worker training record
- \`is-worker-certified\`: Check worker certification status

### Compliance Monitoring

#### Public Functions
- \`register-site\`: Register a construction site
- \`record-compliance-check\`: Record compliance inspection

#### Read-Only Functions
- \`get-site-compliance\`: Get site compliance information
- \`get-compliance-check\`: Get compliance check details
- \`is-site-compliant\`: Check if site meets compliance standards

### Risk Assessment

#### Public Functions
- \`create-risk-assessment\`: Create a new risk assessment
- \`update-assessment-status\`: Update assessment status

#### Read-Only Functions
- \`get-risk-assessment\`: Get risk assessment details
- \`get-site-risk-summary\`: Get site risk summary
- \`has-critical-risks\`: Check for critical risks

## Error Codes

### Safety Coordinator Verification
- \`ERR_UNAUTHORIZED (u100)\`: Unauthorized access
- \`ERR_ALREADY_REGISTERED (u101)\`: Coordinator already registered
- \`ERR_NOT_FOUND (u102)\`: Coordinator not found
- \`ERR_INVALID_STATUS (u103)\`: Invalid status value

### Incident Tracking
- \`ERR_UNAUTHORIZED (u200)\`: Unauthorized access
- \`ERR_INVALID_SEVERITY (u201)\`: Invalid severity level
- \`ERR_INCIDENT_NOT_FOUND (u202)\`: Incident not found

### Training Management
- \`ERR_UNAUTHORIZED (u300)\`: Unauthorized access
- \`ERR_TRAINING_NOT_FOUND (u301)\`: Training program not found
- \`ERR_ALREADY_COMPLETED (u302)\`: Training already completed

### Compliance Monitoring
- \`ERR_UNAUTHORIZED (u400)\`: Unauthorized access
- \`ERR_SITE_NOT_FOUND (u401)\`: Construction site not found
- \`ERR_INVALID_SCORE (u402)\`: Invalid compliance score

### Risk Assessment
- \`ERR_UNAUTHORIZED (u500)\`: Unauthorized access
- \`ERR_ASSESSMENT_NOT_FOUND (u501)\`: Risk assessment not found
- \`ERR_INVALID_RISK_LEVEL (u502)\`: Invalid risk level

## Contributing

1. Fork the repository
2. Create a feature branch: \`git checkout -b feature/new-feature\`
3. Make your changes and add tests
4. Run the test suite: \`npm test\`
5. Commit your changes: \`git commit -am 'Add new feature'\`
6. Push to the branch: \`git push origin feature/new-feature\`
7. Submit a pull request

## Security Considerations

- All contracts implement proper access controls
- Input validation is performed on all public functions
- Error handling prevents contract failures
- Coordinator verification ensures authorized access
- Data integrity is maintained through blockchain immutability

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support and questions:
- Create an issue in the GitHub repository
- Contact the development team
- Check the documentation for common solutions

## Roadmap

- [ ] Integration with IoT safety sensors
- [ ] Mobile app for field workers
- [ ] Advanced analytics and reporting
- [ ] Multi-language support
- [ ] Integration with existing safety management systems
- [ ] Automated compliance reporting
- [ ] Real-time safety alerts and notifications
  \`\`\`

Now let's create the PR details file:

