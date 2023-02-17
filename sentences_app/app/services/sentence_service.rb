 module SentenceService
  module_function

  def create_sentence(text: )
    sentence = Sentence.create(text:)
    sentence.create_parts
  end

  def define_entity(sentence_part_id:, entity_type_name:)
    sentence_part = SentencePart.find_by(id: sentence_part_id)
    return unless sentence_part

    name = EntityType.sanitize(text: entity_type_name)
    entity_type = EntityType.find_by(name:)
    entity_type = EntityType.create(name:) unless entity_type

    sentence_part.update(entity_type:)
  end

 end
