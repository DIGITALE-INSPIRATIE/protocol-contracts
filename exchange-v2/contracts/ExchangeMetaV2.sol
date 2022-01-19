// SPDX-License-Identifier: MIT

pragma solidity 0.7.6;
pragma abicoder v2;

import "./ExchangeV2Core.sol";
import "./EmptyGap.sol";
import "@rarible/meta-tx/contracts/EIP712MetaTransaction.sol";

contract ExchangeMetaV2 is ExchangeV2Core, EmptyGap, EIP712MetaTransaction {
    function __ExchangeV2_init(
        ITransferManager newRaribleTransferManager,
        uint newProtocolFee
    ) external initializer {
        __Context_init_unchained();
        __Ownable_init_unchained();
        __OrderValidator_init_unchained();
        __MetaTransaction_init_unchained("ExchangeMetaV2", "1");
        __EchangeV2Core_init_unchained(newRaribleTransferManager, newProtocolFee);
    }

    function _msgSender() internal view virtual override(ContextUpgradeable, EIP712MetaTransaction) returns (address payable) {
        return super._msgSender();
    }

//    function getOrderProtocolFee(LibOrder.Order memory order, bytes32 hash) override internal view returns(uint) {
//        if (isTheSameAsOnChain(order, hash)) {
//            return onChainOrders[hash].fee;
//        } else {
//            return protocolFee;
//        }
//    }
//
//    function getProtocolFee() override internal view returns(uint) {
//        return protocolFee;
//    }
}
