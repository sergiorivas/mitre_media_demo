class SentencesController < ApplicationController
  before_action :set_sentence, only: %i[ show edit update destroy ]

  # GET /sentences or /sentences.json
  def index
    @sentences = Sentence.all
  end

  # GET /sentences/new
  def new
    @sentence = Sentence.new
  end

  # GET /sentences/1/edit
  def edit
  end

  # POST /sentences
  def create
    @sentence = Sentence.new(sentence_params)
    new_sentence = SentenceService.create_sentence(text: @sentence.text)
    redirect_to edit_sentence_url(new_sentence), notice: "Sentence was successfully created."
  end

  # PATCH/PUT /sentences/1
  def update
    if @sentence.update(sentence_params)
      redirect_to edit_sentence_url(@sentence), notice: "Sentence was successfully updated."
      return
    end

    render :edit, status: :unprocessable_entity
  end

  # DELETE /sentences/1
  def destroy
    @sentence.destroy
    redirect_to sentences_url, notice: "Sentence was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sentence
      @sentence = Sentence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sentence_params
      params.require(:sentence).permit(:text)
    end
end
