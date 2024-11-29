class PollsController < ApplicationController
  before_action :authenticate_user!, only: %i[vote]

  before_action :set_poll, only: %i[ show edit update destroy]

  # GET /polls or /polls.json
  def index
    @polls = Poll.all
  end

  # GET /polls/1 or /polls/1.json
  def show
  end

  # GET /polls/new
  def new
    @poll = Poll.new
    3.times { @poll.answers.build } # Add default number of answers
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls or /polls.json
  def create
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: "Poll was successfully created." }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1 or /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: "Poll was successfully updated." }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  def vote
    @answer = Answer.find(params[:answer_id])
    @answer.add_user(current_user.id)
    @answer.increment!(:votes)

    mail = UsersMailer.after_voting_email(current_user.id, @answer.poll.id)
    mail.deliver_later

    redirect_to poll_path(@answer.poll), notice: "Thank you for voting!"
  end

  # DELETE /polls/1 or /polls/1.json
  def destroy
    @poll.destroy!

    respond_to do |format|
      format.html { redirect_to polls_path, status: :see_other, notice: "Poll was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_poll
    @poll = Poll.find(params.expect(:id))
    @answers = @poll.answers
  end

  # Only allow a list of trusted parameters through.
  def poll_params
    params.require(:poll).permit(:title, answers_attributes: [ :id, :name, :_destroy ])
  end
end
