import React from 'react'

export class SubjectInfo extends React.Component {

  constructor() {
     super();
     this.state = {
        subjects: []
      };
   }
   
   componentDidMount() {
    fetch("/api/v1/subjects")
    .then(resp => resp.json())
    .then(s => {
      this.setState({
        subjects: s
      })
    })
    .catch(error => console.log(error))
  }

  render() {
    return (
      <div>
      {this.state.subjects.map(obj =>
        <p key={obj.id}>{obj.title}</p>
      )}
      </div>
   )
  }
}
export default SubjectInfo;