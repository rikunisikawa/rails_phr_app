class ApplicationController < ActionController::Base
  before_action :set_sidebar_data

  private

  def set_sidebar_data
    @sidebar_links = [
      { name: 'ホーム', path: root_path },
      { name: '記録一覧', path: records_path },
      { name: '登録 / 編集', path: new_record_path }
      # 他のリンクやデータを追加
    ]
  end
end
