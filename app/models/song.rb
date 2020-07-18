class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_ids=(contents)
      contents.each do |c|
        note = Note.create(content: c)
        self.notes << note
      end
  end
  # add associations here
end
