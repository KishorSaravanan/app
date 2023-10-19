class EmployeeService

  def self.create_employee(params)
    Employee.create(params)
  end

  def self.update_employee(employee, params)
    employee.update(params)
  end

end