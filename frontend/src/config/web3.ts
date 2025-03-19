import { http, createConfig, Chain } from 'wagmi'
import { injected } from 'wagmi/connectors'
import { type Config } from 'wagmi'

// 定义Monad测试网
export const monadTestnet: Chain = {
  id: 1_337_544_045,
  name: 'Monad Testnet',
  network: 'monad-testnet',
  nativeCurrency: {
    decimals: 18,
    name: 'MONAD',
    symbol: 'MONAD',
  },
  rpcUrls: {
    default: { http: ['https://rpc.testnet.monad.xyz/'] },
    public: { http: ['https://rpc.testnet.monad.xyz/'] },
  },
  blockExplorers: {
    default: { name: 'Explorer', url: 'https://explorer.testnet.monad.xyz' },
  },
  testnet: true,
}

// 定义Hardhat本地网络
export const hardhatLocal: Chain = {
  id: 31337,
  name: 'Hardhat Local',
  network: 'hardhat',
  nativeCurrency: {
    decimals: 18,
    name: 'Ethereum',
    symbol: 'ETH',
  },
  rpcUrls: {
    default: { http: ['http://127.0.0.1:8545'] },
    public: { http: ['http://127.0.0.1:8545'] },
  },
  testnet: true,
}

// wagmi 配置
export const config: Config = createConfig({
  chains: [monadTestnet, hardhatLocal],
  transports: {
    [monadTestnet.id]: http(monadTestnet.rpcUrls.default.http[0]),
    [hardhatLocal.id]: http(hardhatLocal.rpcUrls.default.http[0])
  },
  connectors: [injected()]
})

// 合约地址
export const CONTRACT_ADDRESSES = {
  FARM_NFT: '',  // 部署后填入
  FARM_TOKEN: '', // 部署后填入
  FARM_GAME: ''  // 部署后填入
}