class PeopleController < ApplicationController
	def index
		@people = Person.show_people
		if @people.empty?
			render 'no_people_found'
		end
	end

	def show
		begin
			@person = Person.find params[:id]
		rescue ActiveRecord::RecordNotFound
			render 'no_people_found'
		end
	end
	def new
		@person = Person.new
	end
	def create
		@person = Person.new person_params
		if @person.save
			@person.projects << Project.find(params[:participation][:project_id])
			redirect_to action: 'index', controller: 'people'
		else
			render 'new'
		end
	end

	def edit
		@person = Person.find params[:id]
	end

	def update
		@person = Person.find params[:id]
		if @person.update_attributes person_params
			redirect_to action: 'index', controller: 'people'
		else
			render 'edit'
		end
		begin
		 	@person.projects << Project.find(params[:participation][:project_id])
		rescue ActiveRecord::RecordNotUnique
		end
	end

	def destroy
		@person = Person.find(params[:id])
		@person.destroy
		redirect_to action: 'index', controller: 'people'
	end

	private

	def person_params
		params.require(:person).permit(:name)
	end
end
