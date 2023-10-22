class EmployeesController < ApplicationController
	def index
		#@employees = Employee.where(id: Employee.select(:id).pluck(:id).sort).page(params[:page])
		@employees = Employee.order(id: :asc).page(params[:page])
	end


	def new
		@employee = Employee.new
	end

	#create


	def create
		#puts "params ----->#{params.inspect}"
		#if params[:employee][:name].present?
			@employee = EmployeeService.new.create_employee(employee_params)
			# 	name: params[:employee][:Name],
			# 	phone_number: params[:employee][:PhoneNumber]
			# 	)
			if @employee.save
				redirect_to employees_path notice:'Employee id has been created successfully'
			else 
				render :new
			end
		#else
			#flash.alert = "Empty field"
		#render

	end

	#view

	def show
		@employee = Employee.find(params[:id])
	end

	#edit

	def edit
		@employee = Employee.find(params[:id])
	end

	#update


	def update
		@employee = Employee.find(params[:id])
		#binding.pry
		if EmployeeService.update_employee(@employee,employee_params)
			redirect_to employees_path
		else
			render :edit
		end
	end

	#delete

	def destroy
		@employee = Employee.find(params[:id])
		@employee.destroy
		redirect_to employees_path 
	end

	#pagination using kaminari 



	private

	def employee_params
		#puts "inside employee_params"
		params.require(:employee).permit(:name, :phone_number, :date_of_birth)
	end			 
	
end
