class ProjectsController < ApplicationController
	def index
		@list = Project.last_created_projects(10)
		@worked = Project.total_hours_in_month
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
end
