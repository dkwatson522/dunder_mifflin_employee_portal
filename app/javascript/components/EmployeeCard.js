/* This example requires Tailwind CSS v2.0+ */
import React from 'react'
import { MailIcon, EyeIcon, PencilIcon, TrashIcon } from '@heroicons/react/solid'

export default function EmployeeCard(props) {
  const { employee, setSelectedEmployee } = props;

  return (
    <li
      className="col-span-1 flex flex-col text-center bg-white rounded-lg shadow divide-y divide-gray-200"
    >
      <div className="flex-1 flex flex-col p-8">
        {employee.avatar ?
          <img className="w-32 h-32 object-cover flex-shrink-0 mx-auto bg-black rounded-full" src={employee.avatar} alt="" />
          :
          <span className="text-center inline-flex items-center mx-auto justify-center w-32 h-32 rounded-full bg-gray-500">
            <span className="font-medium text-4xl leading-none text-white">{employee.name.capitalize().getInitials()}</span>
          </span>
        }
        <h3 className="mt-6 text-gray-900 text-sm font-medium capitalize">{employee.name}</h3>
        <dl className="mt-1 flex-grow flex flex-col justify-between">
          <dt className="sr-only">Title</dt>
          <dd className="text-gray-500 text-sm capitalize">{employee.role}</dd>
          <dt className="sr-only">Role</dt>
          <dd className="mt-3">
              { employee.is_admin ? <span className="px-2 py-1 text-green-800 text-xs font-medium bg-green-100 rounded-full">Admin</span> : null }
          </dd>
        </dl>
      </div>
      <div>
        <div className="-mt-px flex divide-x divide-gray-200">
          <div className="-ml-px w-0 flex-1 flex">
            <a
              href={`/users/${employee.id}`}
              className="relative w-0 flex-1 inline-flex items-center justify-center py-4 text-sm text-gray-700 font-medium border border-transparent rounded-br-lg hover:text-gray-500"
            >
              <EyeIcon className="w-5 h-5 text-gray-400" aria-hidden="true" />
              <span className="ml-3"></span>
            </a>
          </div>
          <div className="-ml-px w-0 flex-1 flex">
            <a
              href={`/users/${employee.id}/edit`}
              className="relative w-0 flex-1 inline-flex items-center justify-center py-4 text-sm text-gray-700 font-medium border border-transparent rounded-br-lg hover:text-gray-500"
            >
              <PencilIcon className="w-5 h-5 text-gray-400" aria-hidden="true" />
              <span className="ml-3"></span>
            </a>
          </div>
          <div className="-ml-px w-0 flex-1 flex">
            <a
              className="relative w-0 flex-1 inline-flex items-center justify-center py-4 text-sm text-gray-700 font-medium border border-transparent rounded-br-lg hover:text-gray-500"
            >
              <TrashIcon
              className="w-5 h-5 text-gray-400"
              aria-hidden="true"
              onClick={() => setSelectedEmployee(employee)}
              >
              </TrashIcon>

              <span className="ml-3"></span>
            </a>
          </div>
        </div>
      </div>
    </li>

  )
}
