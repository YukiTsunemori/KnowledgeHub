import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"];

  connect() {
    this.scrollToBottom();
    this.observe();
  }

  scrollToBottom() {
    if (this.hasMessageTarget) {
      this.messageTargets[this.messageTargets.length - 1]?.scrollIntoView({ behavior: "smooth" });
    }
  }

  // Turbo Streamsで新しいメッセージが追加された時にもスクロールしたい場合はMutationObserverを使う
  observe() {
    const observer = new MutationObserver(() => this.scrollToBottom());
    observer.observe(this.element, { childList: true, subtree: true });
  }
}

