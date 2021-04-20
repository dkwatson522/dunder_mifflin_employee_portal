import React from "react"
import PropTypes from "prop-types"
// import EmployeeCard from "./EmployeeCard"
// import Toggle from "./Toggle"

class HelloWorld extends React.Component {
  render () {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
      </React.Fragment>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
};
export default HelloWorld
