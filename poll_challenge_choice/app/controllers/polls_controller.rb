class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :update, :destroy]

  api :GET, '/polls', 'Lista a enquete e Atividade'
  def index
    @polls = Poll.all
     #@vote = Vote.new
    render json: @polls
  end

  api :GET, '/polls/1', 'Mostra os Detalhes da ENQUETE'
  def show
    render json: @poll
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
  
  # POST /polls
  def create
    @poll = Poll.new(poll_params)

    #if @poll.save
      #render json: @poll, status: :created, location: @poll
    #else
      #render json: @poll.errors, status: :unprocessable_entity
    #end
    
    if @poll.save
      render json: @poll, status: :created
    else
      render json: @poll, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /polls/1
  def update
    if @poll.update(poll_params)
      render json: @poll
    else
      render json: @poll.errors, status: :unprocessable_entity
    end
  end

  # DELETE /polls/1
  def destroy
    @poll.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def poll_params
      #params.require(:poll).
      params.permit(:poll_id,:description)
    end
end
