class RecordsController < ApplicationController
  def index
    @selected_date = params[:date] ? Date.strptime(params[:date], "%Y-%m") : Date.today
    start_of_month = @selected_date.beginning_of_month
    end_of_month = @selected_date.end_of_month
    @records = Record.where(date: start_of_month..end_of_month)
    @record = Record.new
    p @record
    
    all_dates = (start_of_month..end_of_month).to_a

    @health_scores = all_dates.map { |date| [date, @records.find { |r| r.date == date }&.health_score] }.to_h
    @mood_scores = all_dates.map { |date| [date, @records.find { |r| r.date == date }&.mood_score] }.to_h
    @muscle_training_data = all_dates.map { |date| [date, @records.find { |r| r.date == date }&.muscle_training ? 5 : nil] }.to_h
    @running_data = all_dates.map { |date| [date, @records.find { |r| r.date == date }&.running ? 15 : nil] }.to_h
    @stretching_data = all_dates.map { |date| [date, @records.find { |r| r.date == date }&.stretching ? 25 : nil] }.to_h

    @show_popup = true
    # !session[:popup_shown] || params[:show_popup] == 'true'
    # session[:popup_shown] = true

    p '@show_popup----------------'
    p @show_popup


    # p 'health_scores----------------'

    # p 'health_scores----------------'
    # p @health_scores
    # p 'mood_scores----------------'

    # p @mood_scores 
    # p 'muscle_training_data----------------'

    # p @muscle_training_data
    # p 'running_data----------------'
    # p @running_data
    # p 'stretching_data----------------'
    # p @stretching_data

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
    p @record
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

  def daily_summary
    @selected_date = params[:date] ? Date.parse(params[:date]) : Date.today
    @records = Record.where(date: @selected_date)
  end

  private

  def record_params
    params.require(:record).permit(:date, :health_score, :mood_score, :stress_level, :concentration, :fatigue, :weight, :temperature, :sleep_duration, :memo, :muscle_training, :running, :stretching)
  end
end