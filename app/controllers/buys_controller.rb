class BuysController < ApplicationController
  def index
  end

  def create
    # binding.pryは処理に不要なので削除する
    # 値をDBへ保存する実装
  end
  
  private
  
    def メソッド名
      params.permit(指定のカラムを記述する)
    end

  def new
  end
   
end
