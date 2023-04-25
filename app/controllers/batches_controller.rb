# class BatchesController < InheritedResources::Base
class BatchesController < ApplicationController

  def index
    @batches = Batch.all
  end

  private

    def batch_params
      params.require(:batch).permit(:coop_member_id, :group_remit_id, :effectivity_date, :expiry_date, :active, :coop_sf_amount, :agent_sf_amount)
    end

end
