import { Controller } from "@hotwired/stimulus"
import { get }        from "@rails/request.js";

export default class extends Controller {
  static targets = ["branchSelect"]
  change(event) {
    // console.log("Hello World!")
    let coop_id = event.target.selectedOptions[0].value
    let target = this.branchSelectTarget.id

    // console.log(event.target.selectedOptions[0].value)

    get(`/cooperatives/${coop_id}/selected?target=${target}`,
    {
      responseKind: "turbo-stream"
    })
  }
}
