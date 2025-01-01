class RecordsController < ApplicationController
  def index
    @selected_date = params[:date] ? Date.strptime(params[:date], "%Y-%m") : Date.today
    start_of_month = @selected_date.beginning_of_month
    end_of_month = @selected_date.end_of_month
    @records = Record.where(date: start_of_month..end_of_month)
    
    all_dates = (start_of_month..end_of_month).to_a

    @health_scores = all_dates.map { |date| [date, @records.find { |r| r.date == date }&.health_score] }.to_h
    @mood_scores = all_dates.map { |date| [date, @records.find { |r| r.date == date }&.mood_score] }.to_h
    @muscle_training_data = all_dates.map { |date| [date, @records.find { |r| r.date == date }&.muscle_training ? 1 : nil] }.to_h
    @running_data = all_dates.map { |date| [date, @records.find { |r| r.date == date }&.running ? 1 : nil] }.to_h
    @stretching_data = all_dates.map { |date| [date, @records.find { |r| r.date == date }&.stretching ? 1 : nil] }.to_h

    p @records
    p 'health_scores----------------'

    p 'health_scores----------------'
    p @health_scores
    p 'mood_scores----------------'

    p @mood_scores 
    p 'muscle_training_data----------------'

    p @muscle_training_data
    p 'running_data----------------'
    p @running_data
    p 'stretching_data----------------'
    p @stretching_data

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
    params.require(:record).permit(:date, :health_score, :mood_score, :stress_level, :concentration, :fatigue, :weight, :temperature, :memo, :muscle_training, :running, :stretching)
  end
end