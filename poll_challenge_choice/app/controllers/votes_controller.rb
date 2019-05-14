class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update, :destroy]

 
  # GET /votes
  def index
    @votes = Vote.all
     @vote = Vote.new
    render json: @votes
  end
  
   # -- PEGA O VOTO
   def vote
    if params[:vote].present?
      params_options = params[:vote][:option_id]
      if vote.save
        redirect_to root_path, notice: '----VOTO COMPUTADO----'
      end
    else
      redirect_to root_path, notice: '-----VOTO NAO COMPUTADO-----'
    end
  end

  # GET /votes/1
  def show
    render json: @vote
  end

  # POST /votes
  #def create
    #@vote = Vote.new(vote_params)

    #if @vote.save
      #render json: @vote, status: :created, location: @vote
    #else
      #render json: @vote.errors, status: :unprocessable_entity
    #end
  #end

  # PATCH/PUT /votes/1
  #def update
    #if @vote.update(vote_params)
      #render json: @vote
    #else
      #render json: @vote.errors, status: :unprocessable_entity
    #end
  #end

  # DELETE /votes/1
  #def destroy
    #@vote.destroy
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_vote
     # @vote = Vote.find(params[:id])
    #end

    # Only allow a trusted parameter "white list" through.
    def vote_params
      params.permit(:option_id)
    end
end
