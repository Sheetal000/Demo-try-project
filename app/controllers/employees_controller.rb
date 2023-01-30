class EmployeesController < ApplicationController
	http_basic_authenticate_with name: "shee", password: "ser", except: [:index, :show]
    def index
        @employee = Employee.all  
    end

		def new
			@employee = Employee.new
		end

		def create
			@employee = Employee.new(employee_params)
			if @employee.save
				redirect_to @employee
			else
				render :new, status: :unproceesable_entity
			end
		end

		def show
			@employee = Employee.find(params[:id])
		end

		def update
			@employee = Employee.find(params[:id])
			if @employee.update(employee_params)
				redirect_to @employee
			else
				render :show, status: :unproceesable_entity
			end
		end
		 private

		def employee_params	
			params.require(:employee).permit(:first_name,:last_name)
		end
 end
