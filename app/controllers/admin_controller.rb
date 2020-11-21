class AdminController < ApplicationController
   before_action :authenticate_user!
   
  def index
    @pending_reg = Registration.where(verified: false).count()
    logger.info "pending is #{@pending_reg.inspect}"
    @total_reg_app = Registration.where(src:  'APP').count()
    @pending_app = PreAppointment.where(confirm_status: false).count()
    @confimed_app = ConfirmedAppointment.count()
    @total_prov = ProviderMaster.count()
    @total_cust = PersonInfo.where(person_type_id: 'C').count()

  end
  

end
