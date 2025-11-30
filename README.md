# Foundry NFT Project

A Foundry-based project demonstrating ERC721 NFT contracts with mood-changing functionality.

## Features

- **BasicNFT**: Simple ERC721 NFT with custom token URIs
- **MoodNFT**: Dynamic ERC721 NFT that can flip between happy and sad moods with on-chain SVG images
- **Deployment Scripts**: Foundry scripts for deploying and interacting with contracts
- **Comprehensive Tests**: Unit and integration tests

## Prerequisites

- [Foundry](https://getfoundry.sh/)
- [Git](https://git-scm.com/)

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd foundry-nft-f23
```

2. Install dependencies:
```bash
make install
```

3. Build the project:
```bash
make build
```

## Usage

### Local Development

Start a local Anvil node:
```bash
make anvil
```

### Deploy Contracts

Deploy BasicNFT:
```bash
make deploy
```

Deploy MoodNFT:
```bash
make deployMood
```

### Mint NFTs

Mint a BasicNFT:
```bash
make mint
```

Mint a MoodNFT:
```bash
make mintMood
```

Flip MoodNFT mood (replace TOKEN_ID):
```bash
make flipMood TOKEN_ID=0
```

## Testing

Run all tests:
```bash
make test
```

Run tests with gas reporting:
```bash
make snapshot
```

## Project Structure

```
├── src/
│   ├── BasicNFT.sol      # Basic ERC721 NFT contract
│   └── MoodNFT.sol       # Mood-changing ERC721 NFT
├── script/
│   ├── DeployBasicNFT.s.sol
│   ├── DeployMoodNFT.s.sol
│   └── interactions/     # Interaction scripts
├── test/
│   ├── units/            # Unit tests
│   └── integrations/     # Integration tests
├── img/                  # SVG assets for MoodNFT
└── lib/                  # Dependencies (OpenZeppelin, forge-std, foundry-devops)
```

## Dependencies

- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts) v5.0.2
- [forge-std](https://github.com/foundry-rs/forge-std) v1.8.2
- [foundry-devops](https://github.com/Cyfrin/foundry-devops) v0.2.2

## License

This project is licensed under the MIT License.
