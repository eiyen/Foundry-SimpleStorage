-include .env

deploy-sepolia:
	forge create --rpc-url $(SEPOLIA_RPC_URL) \
    --private-key ${PRIVATE_KEY} \
    --etherscan-api-key ${ETHERSCAN_API_KEY} \
    --verify \
    src/SimpleStorage.sol:SimpleStorage

setup-proxy:
	export hostip=$$(cat /etc/resolv.conf | grep -oP '(?<=nameserver\ ).*'); \
	export https_proxy="http://$${hostip}:7890"; \
	export http_proxy="http://$${hostip}:7890";
