class ProjectsController < ApplicationController
	def index
		@list = Project.last_created_projects(10)
		if @list.empty?
			render 'no_projects', layout: 'no_projects'
		end
	end
	def show
		begin
			@project = Project.find params[:id]
			@worked = @project.total_hours_in_month
		rescue ActiveRecord::RecordNotFound
			render 'no_projects_found'
		end
	end
	def new
		@project = Project.new
	end
	def create
		@project = Project.new project_params
		if @project.save
			redirect_to action: 'index', controller: 'projects'
		else
			render 'new'
		end
	end

	def edit
		@project = Project.find params[:id]
	end

	def update
		@project = Project.find params[:id]
		if @project.update_attributes project_params
			redirect_to action: 'index', controller: 'projects'
		else
			render 'edit'
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.entries.destroy_all
		@project.destroy
		redirect_to action: 'index', controller: 'projects'
	end

	private

	def project_params
		params.require(:project).permit(:name, :description, :logo)
	end
end
