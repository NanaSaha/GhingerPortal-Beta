class User < ActiveRecord::Base
   self.primary_key = "person_id"
  
 
   # format: { with: /\A[a-zA-Z]+\z/, message: "Username must be letters only!" }
  
   validates_confirmation_of :password
   
    # has_secure_password 
    validate :password, unless: :persisted?
   # has_secure_password
  
    has_many :confirmed_appointments
    has_many :confirme_personal_doctor_services 
    has_many :country_masters
    has_many :region_masters
    has_many :city_town_masters
    has_many :suburb_masters
    has_many :service_masters
    has_many :service_prov_types
    has_many :provider_masters
    has_many :person_infos
    has_many :registrations, class_name: "Registration", foreign_key: :user_id
    has_many :referals
    
    
    belongs_to :person_info, class_name: "PersonInfo", foreign_key: :person_id
    
    belongs_to :role, class_name: "Role", foreign_key: :role_id
    
    
  
  def current_password_same_as_password
      errors[:current_password] << 'Incorrect password' unless self.current_password == self.password
  end

   
  def super_admin?
    @roles = Role.find(self.role_id)
    @roles['name'] == "Super Admin" #can be the name you user for admin
  end
  
  has_attached_file :profile, styles: { large: "600x600>", medium: "300x300>", thumb: "120x120#" }, default_url: "user.png"
  validates_attachment_content_type :profile, content_type: /\Aimage\/.*\z/
  validates :role_id, presence: {message: "Please select a user role"}
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   
   
   
   # if :bypass_valid
     # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable
   # else
     # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable, :validatable
   # end
   
  
 
   
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  
  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :timeout_in => 2.minutes
#   
  
  
  
   # devise :validatable unless :bypass_valid
     
  # validates :password, presence: true unless :correct_password
         
  
  # active for authentication
  def active_for_authentication?
     super && active_status?
  end
  
  
  
  # has_one :person_type_master, through: :person_info
  
    
  #attr_accessor :bypass 
#   
  def bypass_valid
     self.persisted? #and self.bypass
  end
  
  # def get_current_pass
     # current_pass =  self.password    
  # end
  
  
    # def super_admin?
    # @roles = Role.find(self.role_id)
    # @roles['name'] == "Super Admin" #can be the name you user for admin
    # end
  
  def email_required?
    false
  end

  # def active_for_authentication?
     # super && active_status?
  # end
  
  protected
   def update_resource(resource, params)
    # Require current password if user is trying to change password.
    return super if params["password"]&&present?

    # Allows user to update registration information without password.
    resource.update_without_password(params.except("current_password"))
  end
  
  
 
end
    