import logo from './logo.png';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          <span className = "alert alert-primary">ArDapps</span> Starter Kit For Blockchain Projects with React
        </p>
     
        <a
          className="App-link"
          href="https://ardapps.com"
          target="_blank"
          rel="noopener noreferrer"
        >
          More dapps Courses
        </a>
      </header>
    </div>
  );
}

export default App;
