import { useState } from 'react'
import { WagmiConfig, useAccount, useConnect, useDisconnect, useChainId, useSwitchChain } from 'wagmi'
import { config, monadTestnet, hardhatLocal } from './config/web3'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import './App.css'

const queryClient = new QueryClient()

function ConnectButton() {
  const { address, isConnected } = useAccount()
  const { connect, connectors, isLoading, pendingConnector } = useConnect()
  const { disconnect } = useDisconnect()
  const chainId = useChainId()
  const { switchChain } = useSwitchChain()
  const [selectedNetwork, setSelectedNetwork] = useState(monadTestnet.id)

  if (isConnected) {
    return (
      <div className="wallet-info">
        <span className="address">{`${address?.slice(0, 6)}...${address?.slice(-4)}`}</span>
        <span className="network">{chainId === monadTestnet.id ? 'Monad Testnet' : 'Hardhat Local'}</span>
        <button 
          className="switch-network-btn" 
          onClick={() => switchChain({ chainId: chainId === monadTestnet.id ? hardhatLocal.id : monadTestnet.id })}
        >
          切换到 {chainId === monadTestnet.id ? 'Hardhat' : 'Monad'}
        </button>
        <button className="disconnect-btn" onClick={() => disconnect()}>
          断开连接
        </button>
      </div>
    )
  }

  return (
    <div className="connect-wallet-container">
      <select 
        className="network-select"
        value={selectedNetwork}
        onChange={(e) => setSelectedNetwork(Number(e.target.value))}
      >
        <option value={monadTestnet.id}>Monad Testnet</option>
        <option value={hardhatLocal.id}>Hardhat Local</option>
      </select>
      <button 
        className={`connect-wallet-btn ${selectedNetwork === hardhatLocal.id ? 'hardhat' : ''}`}
        onClick={() => {
          connect({ 
            connector: connectors[0],
            chainId: selectedNetwork
          })
        }}
      >
        {isLoading && connectors[0].id === pendingConnector?.id ? '连接中...' : '连接钱包'}
      </button>
    </div>
  )
}

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <WagmiConfig config={config}>
        <div className="app-container">
          <header className="app-header">
            <h1>Meta Farm</h1>
            <ConnectButton />
          </header>
          <main className="app-main">
            <section className="game-section">
              <h2>我的农场</h2>
              <div className="farm-container">
                {/* 农场游戏内容将在这里展示 */}
              </div>
            </section>
            <section className="nft-section">
              <h2>我的NFT</h2>
              <div className="nft-container">
                {/* NFT列表将在这里展示 */}
              </div>
            </section>
          </main>
        </div>
      </WagmiConfig>
    </QueryClientProvider>
  )
}

export default App
