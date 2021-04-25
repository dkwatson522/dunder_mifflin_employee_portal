import React, { useState, useEffect } from "react"
import EmployeeCard from "./EmployeeCard"
import Modal from "./Modal"
import axios from 'axios'

function EmployeeList() {

  useEffect(() => {
    axios.get('/api/v1/users')
    .then(response => {
      // const allEmployees = response.data
      setEmployees(response.data)
    })
  }, [])

  const [employees, setEmployees] = useState([]);
  const [selectedEmployee, setSelectedEmployee] = useState(null);

  const handleEmployeeDelete = (e) => {
    const deleteURL = `/api/v1/users/${e}`
    console.log('hitting delete')
    axios.delete(deleteURL)
      .then(response => {
        setEmployees(employees.filter(employee => employee.id !== e))
      })
      .catch((err) => {
        console.log(err.response)
      })
  }

  return (
    <React.Fragment>
      <ul className="my-4 grid grid-cols-1 gap-6 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
        {employees.map((employee) => (
          <EmployeeCard
            employee={employee}
            setSelectedEmployee={setSelectedEmployee}
            key={employee.id}
          />
        ))}
      </ul>
      {selectedEmployee && <Modal
      selectedEmployee={selectedEmployee}
      setSelectedEmployee={setSelectedEmployee}
      handleEmployeeDelete={handleEmployeeDelete}
      />}
    </React.Fragment>
  );
}

export default EmployeeList
