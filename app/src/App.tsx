import React, { useEffect } from 'react';
import logo from './logo.svg';
import './App.css';
import {HelloRequest, HelloReply} from './grpc/proto/greet_pb'
import {GreeterClient} from './grpc/proto/GreetServiceClientPb'

function App() {
  useEffect(() => {
    (async function() {
      const service = new GreeterClient("http://172.25.158.208:8080")
      const request = new HelloRequest(); 
      request.setName('lyy')
      const resp = await service.sayHello(request, {'custom-header-1': 'value1'})
      console.log("respresp",resp);
    })()
  }, [])

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
