import { Controller } from "@hotwired/stimulus"
import { get }        from "@rails/request.js";

export default class extends Controller {
  static targets = ["dependentSelect", "typeSelect"]
  change(event) {
    let mem_id = event.target.selectedOptions[0].value
    let target = this.dependentSelectTarget.id
    
    get(`/batch_dependents/${mem_id}/selected?target=${target}`,
    {
      responseKind: "turbo-stream"
    })

    if(this.typeSelectTarget.id !== 'undefined')
    {
      let target2 = this.typeSelectTarget.id
      get(`/batch_dependents/${mem_id}/selected2?target2=${target2}`,
      {
        responseKind: "turbo-stream"
      })
    }
    
  }
  
}