module SentencesHelper
  def decorate_sentence_part(sentence_part)
    return sentence_part.text unless sentence_part.entity?

    %{
      <span class='rounded-lg border-black py-2 ml-1 px-3 bg-gray-100 font-semibold'>
        #{sentence_part.text}
        <span class='ml-2 font-bold' style='color: ##{sentence_part.entity_type.color}'>
          #{sentence_part.entity_type.name}
        </span>
      </span>
    }.html_safe
  end
end
