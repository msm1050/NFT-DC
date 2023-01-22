import React, { Component } from 'react';
import logo from './logo.png';
import './App.css';
import web3 from "web3";
import detectEthereumProvider from '@metamask/detect-provider';

function App() {
  return (
    <div className="App">

      <div> 
          <nav className='navbar navbar-dark bg-dark'>
            <div className='container-fluid'>
                <a className='navbar-brand' href='#'>Alyafie NFTs</a>
            </div>
          </nav>
      </div>
      <h1>Welcome to NFT MarketPlace</h1>
    </div>
  );
}

export default App;
