module SentencesHelper
  def decorate_sentence_part(sentence_part)
    return sentence_part.text unless sentence_part.entity?

    %(
      <span
        class='rounded-lg border-black py-2 ml-1 mr-2 px-3'
        style='background-color: ##{sentence_part.entity_type.color}'
      >
        #{sentence_part.text}
        <span class='mx-1 font-bold'>
          #{sentence_part.entity_type.name}
        </span>
      </span>
    ).html_safe
  end
end
