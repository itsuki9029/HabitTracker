import { Controller } from "@hotwired/stimulus";
import { patch } from "@rails/request.js";

export default class extends Controller {
  async toggleCheckbox(event) {
    const checkbox = event.currentTarget;
    const habitId = checkbox.dataset.habitId;
    const checked = checkbox.checked;

    // サーバーへ状態を送信
    const response = await patch(`/habits/${habitId}/toggle_progress`, {
      body: JSON.stringify({ checked: checked }),
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
    });

    if (!response.ok) {
      alert("進捗の更新に失敗しました");
    }
  }
}
