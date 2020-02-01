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
    #挨拶、時間ごとに変化
    @nowTime = DateTime.now.hour  #挨拶表示のため、現在時刻を取得
    @greeting = "調子はどうですか？"
    if @nowTime >= 4 && @nowTime < 10
      @greeting = "おはようございます!!"
    elsif @nowTime >= 10 && @nowTime < 18
      @greeting = "こんにちは!!"
    elsif @nowTime >= 18 && @nowTime < 23 || @nowTime >= 0
      @greeting = "こんばんわ!!"
    end
    #挨拶ここまで


    @user = User.find(params[:id])
    @goal = Goal.find(current_user.goal_id)
    @date = (Date.current - @user.created_at.to_date + 1).numerator #何日め表記なので現在日-登録日+1
    
    @total_time = @user.y_times.sum(:time)
    @progress_rate = 100*(@user.y_times.sum(:time) / @goal.time).round(5) #進捗率、小数点5桁まで表示すれば数値が変化しないということはないという考え
    #binding.pry


    @y_time = YTime.new() #積み上げ時間入力フォーム用

    @data = User.find(params[:id]).y_times.pluck(:created_at, :time) #積み上げ時間取得


    #統計データここから################################################################
    #入力日ごとのスタック時間
    @daily_total_data = [[@user.created_at.strftime('%m/%d'),0.0]]
      for i in 0..@data.length-1 do
        if i == 0
          @daily_total_data << [@data[0][0].strftime('%m/%d'),@data[0][1]]
        else
          @daily_total_data << [@data[i][0].strftime('%m/%d'),@daily_total_data.last[1] + @data[i][1]]
        end
      end

    #入力日ごとのスタック進捗率
    @daily_progress_data = []
      for i in 0..@daily_total_data.length-1 do
        @daily_progress_data << [@daily_total_data[i][0], ((@daily_total_data[i][1]) / (@goal.time) * 100).round(5) ]
      end
  
    #曜日毎のスタック時間
    @sca_data = [[@user.created_at.strftime('%w'),0.0]]
      for i in 0..@data.length-1 do
        if i == 0
          @sca_data << [@data[0][0].strftime('%w'),@data[0][1]]
        else
          @sca_data << [@data[i][0].strftime('%w'),@sca_data.last[1] + @data[i][1]]
        end
      end
    #入力日毎（日毎に合計値を算出）の時間
    if @data.length > 0
    @pie_data = [[@data[0][0].strftime('%m/%d'),@data[0][1]]]
      for i in 1..@data.length-1 do
        if @pie_data.last[0] == @data[i][0].strftime('%m/%d')
          @pie_data[@pie_data.size-1] = [@pie_data.last[0] , @pie_data.last[1] + @data[i][1] ]
        else
          @pie_data << [@data[i][0].strftime('%m/%d'), @data[i][1]]
        end
      end
    end

    #入力日毎（日毎に合計値を算出）の時間
    @column_data = @pie_data
    #統計データここまで################################################################
  end

  def new
    
  end

  private
  def user_params
    params.require(:user).permit(:name, :email,:week_time,:image,:public_flag,:goal_id)
  end
end
