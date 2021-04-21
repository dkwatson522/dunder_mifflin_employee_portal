import React, { useState, useEffect } from "react"
// import PropTypes from "prop-types"
import EmployeeCard from "./EmployeeCard"
import axios from 'axios'
// import Toggle from "./Toggle"

function EmployeeList() {

  useEffect(() => {
    axios.get('/api/v1/users')
    .then(response => {
      // const allEmployees = response.data
      setEmployees(response.data)
    })
  }, [])

  const [employees, setEmployees] = useState([])

  const handleDeleteEmployee = (e) => {
    const deleteURL = `/api/v1/users/${e.id}`
    console.log(deleteURL)
    fetch(deleteURL, {
      method: "DELETE"
    }).then(() => {
      //client side delete
      // setEmployees()
    })
  }

  return (
    <React.Fragment>
      <ul className="my-4 grid grid-cols-1 gap-6 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
        {employees.map((employee) => (
          <EmployeeCard employee={employee} key={employee.id} />
        ))}
      </ul>
    </React.Fragment>
  );
}

export default EmployeeList
