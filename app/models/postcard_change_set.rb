class PostcardChangeSet < Valkyrie::ChangeSet
  validate :title_not_blank
  self.fields = [:title]

  def title_not_blank
    return if title.present? && Array.wrap(title).select(&:present?).present?
    errors.add(:title, "can not be blank.")
  end
end
