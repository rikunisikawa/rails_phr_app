class RecordsController < ApplicationController
  def index
    today = Date.today
    @records = Record.all
    @health_scores = @records.group_by_day(:date).average(:health_score)
    @mood_scores = @records.group_by_day(:date).average(:mood_score)
    @exercise_data = @records.group_by_day(:date).average(:exercise).transform_values { |v| v ? 1 : nil }
    @meditation_data = @records.group_by_day(:date).average(:meditation).transform_values { |v| v ? 1 : nil }

    p @exercise_data
    p '----------------'
    p @meditation_data

    # # 今日の数値が入力されているかチェック
    # today_record = @records.find { |r| r.date == today }
    # # 今日の日付のレコードが存在しない場合、新規作成画面にリダイレクト
    # unless today_record&.health_score.present? && today_record&.mood_score.present?
    #   redirect_to new_record_path(date: today.strftime('%Y-%m-%d'))
    # end
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new(date: params[:date])
    p @record
  end

  def create
    @record = Record.new(record_params)
    p @record
    if @record.save
      redirect_to records_path
    else
      render :new
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to @record
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path
  end

  private

  def record_params
    params.require(:record).permit(
      :date, 
      :health_score, 
      :mood_score, 
      :exercise, 
      :exercise_type, 
      :exercise_duration, 
      :meditation, 
      :meditation_duration, 
      :sleep_duration, 
      :stress_level, 
      :weight, 
      :temperature, 
      :concentration, 
      :fatigue, 
      :memo,
      :exercise_type_other # 一時的に許可
    ).tap do |whitelisted|
      # 「その他」が選択された場合、exercise_typeを上書き
      if whitelisted[:exercise_type] == 'その他'
        whitelisted[:exercise_type] = params[:record][:exercise_type_other]
      end
      # 不要なパラメータを削除
      whitelisted.delete(:exercise_type_other)
    end
  end
end