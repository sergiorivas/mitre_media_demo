 module SentenceService
  module_function

  def create_sentence(text:)
    sentence = Sentence.create(text:)
    sentence.create_parts
    sentence
  end

  def define_entity(sentence_part_id:, entity_type_name:)
    sentence_part = SentencePart.find_by(id: sentence_part_id)
    return unless sentence_part

    name = EntityType.sanitize(text: entity_type_name)
    entity_type = EntityType.find_by(name:)
    unless entity_type
      color = EntityType.generate_color
      entity_type = EntityType.create(name:, color:)
    end

    sentence_part.update(entity_type:)
    entity_type
  end

  def reset_part(sentence_part_id:)
    sentence_part = SentencePart.find_by(id: sentence_part_id)
    return unless sentence_part

    sentence_part.update(entity_type: nil)
  end

 end
