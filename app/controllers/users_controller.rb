class UsersController < ApplicationController
  def index
    
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
      user = User.find(current_user.id)
      user.update(user_params)
    if user_params[:week_time] == nil
      redirect_to edit_y_time_path
    else
      redirect_to y_times_path
    end

  end

  def show
    @user = User.find(params[:id])
    @goal = Goal.find(current_user.goal_id)
    @date = (Date.current - @user.created_at.to_date + 1).numerator #何日め表記なので現在美-登録日+1
    
    @total_time = @user.y_times.sum(:time)
    @progress_rate = 100*(@user.y_times.sum(:time) / @goal.time).round(5) #進捗率、小数点5桁まで表示すれば数値が変化しないということはないという考え
    #binding.pry

    @nowTime = DateTime.now.hour  #挨拶表示のため、現在時刻を取得

    @y_time = YTime.new() #積み上げ時間入力フォーム用

    #@data = [['2019-06-01', 100], ['2019-06-02', 200], ['2019-06-03', 150]]
    @data = User.find(params[:id]).y_times.pluck(:created_at, :time)

    #統計データここから
    #日ごと
    @daily_total_data = [[@user.created_at.strftime('%y/%m/%d'),0.0]]
      for i in 0..@data.length-1 do
        if i == 0
          @daily_total_data << [@data[0][0].strftime('%y/%m/%d'),@data[0][1]]
        else
          @daily_total_data << [@data[i][0].strftime('%y/%m/%d'),@daily_total_data.last[1] + @data[i][1]]
        end
      end

    @daily_progress_data = []
      for i in 0..@daily_total_data.length-1 do
        @daily_progress_data << [@daily_total_data[i][0], ((@daily_total_data[i][1]) / (@goal.time) * 100).round(5) ]
      end
  
    @daily_data_pie = [[@user.created_at.strftime('%m/%d'),0.0]]
    for i in 0..@data.length-1 do
      if i == 0
        @daily_total_data_pie << [@data[0][0].strftime('%m/%d'),@data[0][1]]
      else
        @daily_total_data_pie << [@data[i][0].strftime('%m/%d'),@daily_total_data_pie.last[1] + @data[i][1]]
      end
    end

    @daily_total_data_sca = [[@user.created_at.strftime('%d'),0.0]]
    for i in 0..@data.length-1 do
      if i == 0
        @daily_total_data_sca << [@data[0][0].strftime('%d'),@data[0][1]]
      else
        @daily_total_data_sca << [@data[i][0].strftime('%d'),@daily_total_data_sca.last[1] + @data[i][1]]
      end
    end
  end

  def new
    
  end

  private
  def user_params
    params.require(:user).permit(:name, :email,:week_time,:image,:public_flag,:goal_id)
  end
end
