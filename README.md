# ✨ So you want to sponsor a contest

This `README.md` contains a set of checklists for our contest collaboration.

Your contest will use two repos: 
- **a _contest_ repo** (this one), which is used for scoping your contest and for providing information to contestants (wardens)
- **a _findings_ repo**, where issues are submitted. 

Ultimately, when we launch the contest, this contest repo will be made public and will contain the smart contracts to be reviewed and all the information needed for contest participants. The findings repo will be made public after the contest is over and your team has mitigated the identified issues.

Some of the checklists in this doc are for **C4 (🐺)** and some of them are for **you as the contest sponsor (⭐️)**.

---

# Contest setup

## 🐺 C4: Set up repos
- [X] Create a new private repo named `YYYY-MM-sponsorname` using this repo as a template.
- [ ] Get GitHub handles from sponsor.
- [ ] Add sponsor to this private repo with 'maintain' level access.
- [X] Send the sponsor contact the url for this repo to follow the instructions below and add contracts here. 
- [ ] Delete this checklist and wait for sponsor to complete their checklist.

## ⭐️ Sponsor: Provide contest details

Under "SPONSORS ADD INFO HERE" heading below, include the following:

- [ ] Name of each contract and:
  - [ ] lines of code in each
  - [ ] external contracts called in each
  - [ ] libraries used in each
- [ ] Describe any novel or unique curve logic or mathematical models implemented in the contracts
- [ ] Does the token conform to the ERC-20 standard? In what specific ways does it differ?
- [ ] Describe anything else that adds any special logic that makes your approach unique
- [ ] Identify any areas of specific concern in reviewing the code
- [ ] Add all of the code to this repo that you want reviewed
- [ ] Create a PR to this repo with the above changes.

---

# ⭐️ Sponsor: Provide marketing details

- [ ] Your logo (URL or add file to this repo - SVG or other vector format preferred)
- [ ] Your primary Twitter handle
- [ ] Any other Twitter handles we can/should tag in (e.g. organizers' personal accounts, etc.)
- [ ] Your Discord URI
- [ ] Your website
- [ ] Optional: Do you have any quirks, recurring themes, iconic tweets, community "secret handshake" stuff we could work in? How do your people recognize each other, for example? 
- [ ] Optional: your logo in Discord emoji format

---

# Contest prep

## 🐺 C4: Contest prep
- [X] Rename this repo to reflect contest date (if applicable)
- [X] Rename contest H1 below
- [X] Add link to report form in contest details below
- [X] Update pot sizes
- [X] Fill in start and end times in contest bullets below.
- [X] Move any relevant information in "contest scope information" above to the bottom of this readme.
- [ ] Add matching info to the [code423n4.com public contest data here](https://github.com/code-423n4/code423n4.com/blob/main/_data/contests/contests.csv))
- [ ] Delete this checklist.

## ⭐️ Sponsor: Contest prep
- [ ] Make sure your code is thoroughly commented using the [NatSpec format](https://docs.soliditylang.org/en/v0.5.10/natspec-format.html#natspec-format).
- [ ] Modify the bottom of this `README.md` file to describe how your code is supposed to work with links to any relevent documentation and any other criteria/details that the C4 Wardens should keep in mind when reviewing. ([Here's a well-constructed example.](https://github.com/code-423n4/2021-06-gro/blob/main/README.md))
- [ ] Please have final versions of contracts and documentation added/updated in this repo **no less than 8 hours prior to contest start time.**
- [ ] Ensure that you have access to the _findings_ repo where issues will be submitted.
- [ ] Promote the contest on Twitter (optional: tag in relevant protocols, etc.)
- [ ] Share it with your own communities (blog, Discord, Telegram, email newsletters, etc.)
- [ ] Optional: pre-record a high-level overview of your protocol (not just specific smart contract functions). This saves wardens a lot of time wading through documentation.
- [ ] Designate someone (or a team of people) to monitor DMs & questions in the C4 Discord (**#questions** channel) daily (Note: please *don't* discuss issues submitted by wardens in an open channel, as this could give hints to other wardens.)
- [ ] Delete this checklist and all text above the line below when you're ready.

---

# Yeti Finance contest details
- $71,250 USDC main award pot
- $3,750 USDC gas optimization award pot
- Join [C4 Discord](https://discord.gg/code4rena) to register
- Submit findings [using the C4 form](https://code4rena.com/contests/2021-12-yeti-finance-contest/submit)
- [Read our guidelines for more details](https://docs.code4rena.com/roles/wardens)
- Starts December 16, 2021 00:00 UTC
- Ends December 22, 2021 23:59 UTC

This repo will be made public before the start of the contest. (C4 delete this line when made public)

[ ⭐️ SPONSORS ADD INFO HERE ]

# Protocol Overview 

Yeti Finance is a decentralized borrowing protocol with a stablecoin built on Avalanche. Think of it as Liquity + Abracadabra on steriods. Yeti Finance lets users borrow against their staked assets, LP tokens, and other interest-bearing and base-level assets with zero acccruing interest fees. Yeti Finance allows users to borrow against their entire portfolio at once, reducing the risk that one asset flash crashing would result in liquidation. After depositing up their collateral in a smart contract and creating an individual position called a "trove", the user can get instant liquidity by minting YUSD, a USD-pegged stablecoin. Each trove is required to be collateralized at a minimum of 110%. Any owner of YUSD can redeem their stablecoins for the underlying collateral at any time. The redemption mechanism along with algorithmically adjusted fees guarantee a minimum stablecoin value of USD 1.

A liquidation mechanism based on incentivized stability deposits and a redistribution cycle from riskier to safer troves provides stability at a much lower collateral ratio than current systems. Stability is maintained via economically-driven user interactions and arbitrage, rather than by active governance or monetary interventions.

# Specific Protocol Systems Summary and Contract Summary

More information about all of these systems in particular are available on our [docs](https://docs.yetifinance.co)

There are some special economic mechanisms to stabilize the protocol compared to a more standard overcollateralized stablecoin lending protocol. If a user’s individual collateralization ratio (ICR = Value collateral / YUSD Debt) falls below 110%, then they are open to liquidations. These liquidations are done through the stability pool, which is an incentivized pool of YUSD which essentially pays back debt of undercollateralized troves, and gets value in collateral back. Another important mechanism implemented is redemptions, which was the idea that one dollar of YUSD can always redeem for one dollar value of collateral from the system. A less commonly used but still important system is redistributions, where if there is not enough YUSD in the stability pool but there is a trove eligible for liquidation, it will redistribute the debt and collateral to all troves in the system. These systems are quite similar to [Liquity's](https://github.com/liquity/dev), but instead use multiple collateral types at once in a single trove. 

Important: To keep track of the different token values in the system we use a system called “VC” or Virtual Coin which takes riskier assets to have less value in the system than safer assets. Essentially it standardizes the value of all the collateral in one user’s trove into one collateral value number. The VC for a collateral depends on a safety ratio which is defined as a risk parameter when adding the token to the whitelist. $VC = Safety ratio * Token amount * Token price in USD. Example: I have 0.75 wMEMO at $8000 dollars with a safety ratio of ⅔. $VC = 0.75 * ⅔ * 8000 = $4000. So, I can take a loan against this $4000 dollars as if it were $4000 of a safe asset with a safety ratio = 1.

## BorrowerOperations.sol (837 loc)
BorrowerOperations is where users can add/remove collateral, adjust their debt, close their trove, etc. This file has most of the external functions that people will generally interact with. It adjusts the troves stored in TroveManager. The main external functions are 
- openTrove() opens a trove for the user. Does necessary checks on the system and collaterals / debt passed in.
- adjustTrove() allows for any action on a trove as long as it stays above the min debt amount, and the ICR is above the minimum.
- closeTrove() closes the trove by using YUSD from the sender, and returns collateral. Auto unwraps wrapped assets.

## TroveManager.sol (591 loc), TroveManagerLiquidations.sol (646 loc), and TroveManagerRedemptions (356 loc)
TroveManager handles Liquidations, redemptions, and keeps track of the troves’ statuses, aka all the collateral they are holding, and the debt they have. The file was too large so we had to split it into three to be able to deploy. The redemptions and liquidations file handle those respective aspects of the protocol, and the main TroveManager handles the general keeping track of the trove. The main external facing functions are 
- batchLiquidateTroves(), called on a list of troves and liquidates collateral from those troves
- redeemCollateral(), which redeems a certain amount of YUSD from as many troves as it takes to get to that amount. 

## StabilityPool.sol (638 loc)
The stability pool is used to offset loans for liquidation purposes, and holding rewards after liquidations occur. Functions related to frontend operation are not important to look at as that is deprecated in our system. Important external facing functions are: 
- provideToSP(), withdrawFromSP(), functions to change the amount of YUSD that you have in the stability pool, and collect rewards. 

## Whitelist.sol (273 loc) 
Whitelist is where we keep track of allowed tokens for the protocol, and info relating to these tokens, such as oracles, safety ratios, and price curves. Has some onlyOwner functions which are secured by team multisig for adjusting token collateral parameters. Also has important getter functions like getValueVC() and getValueUSD() which are used throughout the code. 

## ThreePieceWiseLinearPriceCurve.sol (100 loc)
We are also adding a variable fee based on the collateral type, which will scale up if that collateral type is currently backing too much value of the protocol. The fee system change is discussed further [here](https://github.com/code-423n4/2021-12-yetifinance/edit/main/YETI_FINANCE_VARIABLE_FEES.pdf). To summarize, it is a one time borrow fee charged on the collateral, which will increase based on how much the system is collateralized by that asset. This price curve is where currently this fee is calculated.
- getFeeAndUpdate is called to update the last time and fee percent, only called by Whitelist functions. 

## sYETIToken.sol (202 loc)
sYETI is the contract for the auto-compounding YETI staking mechanism, which receives fees from redemptions and trove adjustments. This contract buys back YETI, and adjusts the ratio of sYETI to YETI, adapted from the sSPELL contract. The YUSD Token itself is in the YUSDToken file. Follows ERC20 standard. 

## YUSDToken.sol (226 loc)
YUSDToken follows the ERC20 standard and is our stablecoin which we mint from our protocol. This only allows BorrowerOperations.sol to mint using the user facing functions after respective checks. 

## ActivePool.sol (180 loc) 
The Active Pool holds all of the collateral of the system. Handles transfer of collateral in and out, including auto unwrapping assets when called and sending them to a certain sender. 

## DefaultPool.sol (118 loc)
The default pool holds collateral of defaulted troves after liquidation that have not been redistributed yet. 

## CollSurplusPool.sol (116 loc)
CollSurplusPool holds additional collateral after redemptions and liquidations in certain ranges of collateral ratio.

## WJLP.sol (176 loc) (and IWAsset.sol)
We have written wrapper contracts with the intention of them keeping track of staking rewards on behalf of users. For instance, Trader Joe LP Tokens (JLP) can be staked to get rewards in JOE, which is Trader Joe’s token. We allow users to use this wrapped version of JLP that we have made to take out loans on our platform. Though they do not own the tokens that are being staked, they are still being staked on their behalf. When they pull that collateral out, are liquidated, or are redeemed against, they will be eligible for the same JOE rewards to claim as if they had staked themselves. For our protocol, the whitelist keeps track of which whitelisted collateral are ‘wrapped assets,’ because they are handled differently in some cases. Also acts as a normal ERC20


# Areas of Focus 
- General vulnerabilities with multiple assets that may have been overlooked: users should be only able to interact with their own trove, liquidations and redemptions take the correct amount of collateral with edge cases like recovery mode, different safety ratios, etc. 
- Something we have changed significantly and might be good to focus on are the fee system. This fee system is not very battle tested so it may have problems we have not thought about. As mentioned above, we have more detail on fees [here](https://github.com/code-423n4/2021-12-yetifinance/edit/main/YETI_FINANCE_VARIABLE_FEES.pdf)
- Wrapped assets are new as well, and may be good to focus on.
