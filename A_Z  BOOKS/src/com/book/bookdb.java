package com.book;
import java.util.*;
import java.util.Date;
import java.sql.*;
import java.text.SimpleDateFormat;
public class bookdb {
	public static Connection getConnection()
	{
		
		Connection con=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","root");
			
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return con;
	}
	
	public boolean insert(books bd)
		{	
			boolean status=false;
			
			try
		{	
		Connection con=getConnection();
		PreparedStatement pst=(PreparedStatement) con.prepareStatement("insert into bdetails(bname,author,edition,price,stock) values (?,?,?,?,?)");
		pst.setString(1,bd.getBname());
		pst.setString(2,bd.getAuthor());
		pst.setString(3,bd.getEdition());
		pst.setFloat(4,bd.getPrice());
		pst.setInt(5,bd.getStock());
		int s=pst.executeUpdate();
		if(s>0)	
			{	
				status=true;	
			}
		con.close();
		}
		catch(Exception ex)	
			{	
				System.out.println(ex);
			}
			return status;
			}
		
	public int inss()
	{	int bookid=0;
		
	try
	{	
	Connection con=getConnection();
		PreparedStatement ps=(PreparedStatement) con.prepareStatement("select bid from bdetails");		
		ResultSet r=(ResultSet) ps.executeQuery();
		while(r.next())	
		{	 
			bookid=r.getInt(1);	
			}	
		}
		
		catch(Exception ex)	
		{	
			System.out.println(ex);	
			}
		return bookid;	
		}	
	
	public void vobk(int id)
	{
	try
	{
		Connection co=getConnection();
		PreparedStatement ps=(PreparedStatement) co.prepareStatement("select * from bdetails where bid=?;");
		ps.setInt(1,id);
		ResultSet r=(ResultSet) ps.executeQuery();
		while(r.next())	
		{	 
			books bb=new books();
			bb.setBid(r.getInt(1));
			bb.setBname(r.getString(2));
			bb.setAuthor(r.getString(3));
			bb.setEdition(r.getString(4));
			bb.setPrice(r.getFloat(5));
			bb.setStock(r.getInt(6));
			}
		co.close();
		}
		catch(Exception ex)	
		{	
			System.out.println(ex);	
			}
	}
	
	
	
	public boolean icus(books bd)
	{	
		boolean status=false;
		
		try
	{	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","root");
	PreparedStatement pst=conn.prepareStatement("insert into customer(cname,pwd,mail_id,phone_no,addr)value(?,?,?,?,?)");
	pst.setString(1,bd.getCname());
	pst.setString(2,bd.getPwd());
	pst.setString(3,bd.getMail_id());
	
	//pst.setLong(4,bd.getPhone_no());
	pst.setLong(4,(long)(bd.getPh()));
	pst.setString(5,bd.getAddr());
	int s=pst.executeUpdate();
	if(s>0)	
		{	
			status=true;	
		}	
	
	}
	catch(Exception ex)	
		{	
			System.out.println(ex);
		}
		return status;
		}
	
public int incu()
{	int cusid=0;
	
try
{	
	Connection co=getConnection();
	PreparedStatement ps=(PreparedStatement) co.prepareStatement("select cid from customer;");		
	ResultSet r=(ResultSet) ps.executeQuery();
	while(r.next())	
	{	 
		cusid=r.getInt(1);	
		}
	co.close();	
	}
	catch(Exception ex)	
	{	
		System.out.println(ex);	
		}
	return cusid;	
	}	

public static ArrayList<books> getRecord(int start,int total)
{
	ArrayList<books> list=new ArrayList<>();
	try
	{
		Connection con=getConnection();
		PreparedStatement ps=(PreparedStatement) con.prepareStatement("select * from bdetails limit "+start+","+total);
		ResultSet rs=(ResultSet) ps.executeQuery();
		while(rs.next())
		{
			books b=new books();
			b.setBid(rs.getInt(1));
			b.setBname(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setEdition(rs.getString(4));
			b.setPrice(rs.getFloat(5));
			b.setStock(rs.getInt(6));
			list.add(b);	
		}
		con.close();
	}
	catch(Exception ex)
	{
		System.out.println(ex);
	}
	return list;
	
}


public boolean cusmenucheck(int id,String pw)
{
	boolean stu=false;
	try
	{
		Connection con=getConnection();
		PreparedStatement ps=(PreparedStatement) con.prepareStatement("select cid,pwd from customer where cid=? and pwd=?");
		ps.setInt(1,id);
		ps.setString(2,pw);
		ResultSet rs=(ResultSet) ps.executeQuery();
		if(rs.next())
		{
			stu=true;
		}
	}
	catch(Exception ex)
	{
		System.out.println(ex);
	}
	return stu;
	
}


public boolean updatebook(books bd)
{	
	boolean status=false;
	
	try
{	
Connection con=getConnection();
PreparedStatement pst=(PreparedStatement) con.prepareStatement("update bdetails set bname=?,author=?,edition=?,price=?,stock=? where bid=?");
pst.setString(1,bd.getBname());
pst.setString(2,bd.getAuthor());
pst.setString(3,bd.getEdition());
pst.setFloat(4,bd.getPrice());
pst.setInt(5,bd.getStock());
pst.setInt(6,bd.getBid());
int s=pst.executeUpdate();
if(s>0)	
	{	
		status=true;	
	}
con.close();
}
catch(Exception ex)	
	{	
		System.out.println(ex);
	}
	return status;
	}

public boolean deletebook(int bid)
{	
	boolean status=false;
	
	try
{	
Connection con=getConnection();
PreparedStatement pst=(PreparedStatement) con.prepareStatement("delete from bdetails where bid=?");
pst.setInt(1,bid);
int s=pst.executeUpdate();
if(s>0)	
	{	
		status=true;	
	}
con.close();
}
catch(Exception ex)	
	{	
		System.out.println(ex);
	}
	return status;
	}

public String tdate()
{
	Calendar c1=Calendar.getInstance();
	Date dt=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd");
	String odate=sdf.format(dt);
	System.out.println(odate);
	return odate;
	
}


public boolean orders(books bd)
{	
	boolean status=false;
	
	try
{	
Connection con=getConnection();
PreparedStatement pst=(PreparedStatement) con.prepareStatement("insert into norder(cid,bid,qty,tprice,odate,status) values (?,?,?,?,?,?)");
pst.setInt(1,bd.getCid());
pst.setInt(2,bd.getBid());
pst.setInt(3,bd.getQty());
pst.setFloat(4,bd.getTprice());
pst.setString(5,bd.getOdate());
pst.setString(6,bd.getStatus());
int s=pst.executeUpdate();
if(s>0)	
	{	
		status=true;	
	}

}
catch(Exception ex)	
	{	
		System.out.println(ex);
	}
	return status;
	}

public boolean cqty(int bid,int qty) 
{
	boolean status=false;
	try
{	
Connection con=getConnection();
PreparedStatement pst=(PreparedStatement) con.prepareStatement("update bdetails set stock=? where bid=?");
pst.setInt(1,qty);	
pst.setInt(2,bid);	
int s=pst.executeUpdate();
if(s>0)	
	{	
		status=true;	
	}
con.close();
}
catch(Exception ex)	
	{	
		System.out.println(ex);
	}
	return status;
	}




	
public static ArrayList<books> vieworderstatus(int cid)
{
	ArrayList<books> list=new ArrayList<>();
	try
	{
		Connection con=getConnection();
		PreparedStatement ps=(PreparedStatement) con.prepareStatement("select * from norder where cid=?");
		ps.setInt(1,cid);
		ResultSet rs=(ResultSet) ps.executeQuery();
		while(rs.next())
		{
			books b=new books();
			b.setOid(rs.getInt(1));
			b.setCid(rs.getInt(2));
			b.setBid(rs.getInt(3));
			b.setQty(rs.getInt(4));
			b.setTprice(rs.getFloat(5));
			b.setOdate(rs.getString(6));
			b.setStatus(rs.getString(7));
			list.add(b);	
		}
		con.close();
	}
	catch(Exception ex)
	{
		System.out.println(ex);
	}
	return list;
	
}

public float ttprice(int qty,float price) 
{float tprice;
tprice=(price*qty);
return tprice;	
}


public static ArrayList<books> conorderstatus()
{
	ArrayList<books> list=new ArrayList<>();
	try
	{
		Connection con=getConnection();
		PreparedStatement ps=(PreparedStatement) con.prepareStatement("select * from norder");
		ResultSet rs=(ResultSet) ps.executeQuery();
		while(rs.next())
		{
			books b=new books();
			b.setOid(rs.getInt(1));
			b.setCid(rs.getInt(2));
			b.setBid(rs.getInt(3));
			b.setQty(rs.getInt(4));
			b.setTprice(rs.getFloat(5));
			b.setOdate(rs.getString(6));
			b.setStatus(rs.getString(7));
			list.add(b);	
		}
		con.close();
	}
	catch(Exception ex)
	{
		System.out.println(ex);
	}
	return list;
	
}

public boolean conorder2(int oid) 
{
	boolean status=false;
	try
{	
Connection con=getConnection();
PreparedStatement pst=(PreparedStatement) con.prepareStatement("update norder set status='CONFIRM' where oid=?");
pst.setInt(1,oid);		
int s=pst.executeUpdate();
if(s>0)	
	{	
		status=true;	
	}
con.close();
}
catch(Exception ex)	
	{	
		System.out.println(ex);
	}
	return status;
	}

public boolean deleteorderbook(int oid)
{	
	boolean status=false;
	
	try
{	
Connection con=getConnection();
PreparedStatement pst=(PreparedStatement) con.prepareStatement("delete from norder where oid=?");
pst.setInt(1,oid);
int s=pst.executeUpdate();
if(s>0)	
	{	
		status=true;	
	}
con.close();
}
catch(Exception ex)	
	{	
		System.out.println(ex);
	}
	return status;
	}

public boolean cancelorderbook(int cid)
{	
	boolean status=false;
	
	try
{	
Connection con=getConnection();
PreparedStatement pst=(PreparedStatement) con.prepareStatement("delete from norder where cid=?");
pst.setInt(1,cid);
int s=pst.executeUpdate();
if(s>0)	
	{	
		status=true;	
	}
con.close();
}
catch(Exception ex)	
	{	
		System.out.println(ex);
	}
	return status;
	}

public int checkstock(int bid)
{	int stock=0;
try
{
	Connection co=getConnection();
	PreparedStatement ps=(PreparedStatement) co.prepareStatement("select * from bdetails where bid=?");
	ps.setInt(1,bid);
	ResultSet r=(ResultSet) ps.executeQuery();
	while(r.next())	
	{
		stock=r.getInt(6);
		}
	
	}
	catch(Exception ex)	
	{	
		System.out.println(ex);	
	}
return stock;
}

public boolean updateprofile(books bd)
{	
	boolean status=false;
	
	try
{	
Connection con=getConnection();
PreparedStatement pst=(PreparedStatement) con.prepareStatement("update customer set cname=?,pwd=?,mail_id=?,phone_no=?,addr=? where cid=?");
pst.setString(1,bd.getCname());
pst.setString(2,bd.getPwd());
pst.setString(3,bd.getMail_id());
pst.setInt(4,bd.getPhone_no());
pst.setString(5,bd.getAddr());
pst.setInt(6,bd.getCid());
int s=pst.executeUpdate();
if(s>0)	
	{	
		status=true;	
	}

}
catch(Exception ex)	
	{	
		System.out.println(ex);
	}
	return status;
	}

public static ArrayList<books> cusview()
{
	ArrayList<books> list=new ArrayList<>();
	try
	{
		Connection con=getConnection();
		PreparedStatement ps=(PreparedStatement) con.prepareStatement("select * from customer");
		ResultSet rs=(ResultSet) ps.executeQuery();
		while(rs.next())
		{
			books b=new books();
			b.setCid(rs.getInt(1));
			b.setCname(rs.getString(2));
			b.setPwd(rs.getString(3));
			b.setMail_id(rs.getString(4));
			b.setPhone_no(rs.getInt(5));
			b.setAddr(rs.getString(6));
			list.add(b);	
		}
		con.close();
	}
	catch(Exception ex)
	{
		System.out.println(ex);
	}
	return list;
	
}



public int cancelorderqty(int cid)
{	int stock=0,sstock=0;
try
{
	Connection co=getConnection();
	PreparedStatement ps=(PreparedStatement) co.prepareStatement("select * from norder where cid=?");
	ps.setInt(1,cid);
	ResultSet r=(ResultSet) ps.executeQuery();
	while(r.next())	
	{
		sstock=r.getInt(4);
		stock=(stock+sstock);
		}
	
	}
	catch(Exception ex)	
	{	
		System.out.println(ex);	
	}
return stock;
}


}
	
	

	



