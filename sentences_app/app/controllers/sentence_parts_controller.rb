class SentencePartsController < ApplicationController
  # PATCH/PUT / sentence_parts/1
  def update
    sentence_parts_params = params.require(:sentence_part).permit(:entity_type_name)

    sentence_part_id = params[:id]
    entity_type_name = sentence_parts_params[:entity_type_name]

    sentence_part = SentencePart.find_by(id: sentence_part_id)
    unless sentence_part
      redirect_to sentences_url, notice: "Invalid sentence part"
      return
    end

    if entity_type_name.blank?
      SentenceService.reset_part(sentence_part_id:)
      redirect_to edit_sentence_path(sentence_part.sentence), notice: "Part: #{sentence_part.text} was resetted"
      return
    end

    entity_type = SentenceService.define_entity(sentence_part_id:, entity_type_name:)
    redirect_to edit_sentence_path(sentence_part.sentence),
                notice: "Part: #{sentence_part.text} was declared as an entity: #{entity_type.name}"
  end
end
