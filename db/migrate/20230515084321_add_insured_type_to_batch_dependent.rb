class AddInsuredTypeToBatchDependent < ActiveRecord::Migration[7.0]
  def change
    add_reference :batch_dependents, :proposal_insured
  end
end
