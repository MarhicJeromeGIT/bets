class Player < ActiveRecord::Base
  has_many :bets
  has_and_belongs_to_many :events

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  before_create :create_default_bets
  before_create :set_default_points
  
  accepts_nested_attributes_for :bets
  
  # Strange my .joins(:events_players) doesn't seem to work here.
  sql = "SELECT \"players\".* FROM \"players\" INNER JOIN \"events_players\" ON \"events_players\".\"player_id\" = \"players\".\"id\""
  scope :joins_events_players, -> { all }
  scope :subscribed_to, ->(event){ joins(:events).where("events_players.event_id = ?",event.id)}  
  
  def count_points
    score = 0
    self.bets.each do |bet|
      score += 1 if bet.won
    end
    return score
  end
  
  private
    def create_default_bets
      Match.all.each do |m|
        self.bets.build(match: m, result: Match::TIE)
      end
    end
    
    def set_default_points
      self.points = 0
    end
end










