module Api
  module V1
      class RecipestepsController < ApplicationController
        before_action :set_recipestep, only: [:show, :update, :destroy]

        # GET /recipestep
        def index
          @recipesteps = Recipestep.all

          render json: @recipesteps
        end

        # GET /recipesteps/1
        def show
          render json: @recipestep
        end

        # POST /recipesteps
        def create
          @recipestep = Recipestep.new(recipestep_params)

          if @recipestep.save
            render json: @recipestep, status: :created, location: @recipestep
          else
            render json: @recipestep.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /recipesteps/1
        def update
          if @recipestep.update(recipestep_params)
            render json: @recipestep
          else
            render json: @recipestep.errors, status: :unprocessable_entity
          end
        end

        # DELETE /recipesteps/1
        def destroy
          @recipestep.destroy
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_recipestep
            @recipestep = Recipestep.find(params[:id])
          end

          # Only allow a trusted parameter "white list" through.
          def recipestep_params
            params.require(:recipestep).permit(:title, :user_id)
          end
      end
  end 
end
