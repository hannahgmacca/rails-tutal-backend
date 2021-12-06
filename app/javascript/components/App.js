import React, { Component } from 'react'
import SubjectInfo from './SubjectInfo'
import SignUp from './SignUp'


class App extends Component {
  render(){
    return(
      <div>
      <h1> React says Hello! </h1>
      <SubjectInfo/>
      <SignUp/>
      </div>
    )
  }
}

export default App