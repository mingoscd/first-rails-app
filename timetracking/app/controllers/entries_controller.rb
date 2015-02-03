class EntriesController < ApplicationController
	def index
		@project = Project.find params[:id]
		@entries = @project.entries
	end
end
