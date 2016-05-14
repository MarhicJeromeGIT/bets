class Event < ActiveRecord::Base
  has_and_belongs_to_many :players
  belongs_to :owner_player, class_name: "Player"
  
  validates :name, presence: true, uniqueness: true
  validates :owner_player, presence: true

  after_create :add_owner_player_to_players
  
  scope :is_not_member, ->(player){ where('id NOT IN (?)', ([-1] << Event.is_member(player).pluck(:id)).flatten) }
  scope :is_member, ->(player){ joins(:events_players).where("events_players.player_id = ?",player.id)}
  scope :is_owner, ->(player){ where("owner_player_id = ?",player.id)} # the user created this groupe
  
  STATUS_REGISTERING = "Inscriptions"
  STATUS_STARTED= "Commencé"
  STATUS_FINISHED= "Terminé"
  
  def player_count
    Player.subscribed_to(self).count
  end
  
  def is_owner?(player)
    return owner_player == player
  end
  
  def status
   STATUS_REGISTERING
   # if Time.now < self.start_date
   #   STATUS_REGISTERING
   # else
   #    STATUS_STARTED
   # end
  end
  
  private
    def add_owner_player_to_players
      if !owner_player.events.include? self
        owner_player.events << self
      end
    end
end
