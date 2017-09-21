module duffing
  private
  public :: iterate
  public :: init
  ! Module to compute the duffing oscillator
  integer, parameter :: dp = selected_real_kind(15,300) 
  real(kind=dp), parameter :: pi = 3.14159265359_dp
  character(len = 11), parameter :: filename = 'duffing.dat'
  real(kind=dp) :: A,B,C,D,E
  real(kind=dp) :: h = 0.01_dp

contains

  subroutine iterate(steps, init_x, init_v)
    !Iterate for so many steps
    implicit none
    integer, intent(in) :: steps
    real(kind=dp), intent(in), optional :: init_x, init_v
    real(kind=dp) :: x, v, t
    integer :: step
    integer :: ierr
    
    x = 0.0_dp
    v = 1.0_dp
    t = 0.0_dp
    
    if (present(init_x)) x = init_x
    if (present(init_v)) v = init_v

    open (file=filename, unit = 10, iostat=ierr)
    if (ierr.ne.0) stop 'Error opening file: '//filename

    write (10, '(A1, 4X, A1, 2(9X,A1))') "#","X","V","T"
    do step = 1, steps
       call rk2(x,v,t,h)
       write (10, '(3(F9.5,1X))') x,v,t
    end do

    close (10, iostat=ierr)
    if (ierr.ne.0) stop 'Error closing file: '//filename
    
  end subroutine iterate

  subroutine rk2(x,v,t,h)
    
    implicit none
    real(kind=dp), intent(in)  :: h !Step
    real(kind=dp), intent(out) :: x,v,t !Position, Velocity, Time
    real(kind=dp) :: k1, k2, k11, k22 ! RK2 Internals
    
    k11 = h * f1(x,v,t)
    k22 = h * f2(x,v,t)
    k1 =  h * f1(x+k11, v+k22, t+h)
    k2 =  h * f2(x+k11, v+k22, t+h)

    x = x + (k11 + k1)*0.5_dp
    v = v + (k22 + k2)*0.5_dp
    t = t + h
 
  contains
    real(kind=dp) function f1(x,v,t)
      implicit none
      real(kind=dp), intent(in) :: x,v,t
      
      f1=v
      
    end function f1
    
    real(kind=dp) function f2(x,v,t)
      implicit none
      real(kind=dp), intent(in) :: x,v,t
      
      f2 =  -A*x**3 + B*x - C*v + D*sin(E*t);
    end function f2
    
  end subroutine rk2

  subroutine init()
    ! Initialise core variables
    implicit none
    A = 0.0_dp
    B = 0.0_dp
    C = 0.0_dp
    D = 0.0_dp
    E = 0.0_dp
    
  end subroutine init
    
end module duffing
